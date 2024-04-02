# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname='docker-scout'
pkgver=1.6.4
pkgrel=1
pkgdesc="Docker Scout is a set of software supply chain features integrated into Docker's user interfaces and command line interface (CLI)."
url='https://github.com/docker/scout-cli'
arch=('aarch64' 'x86_64')
license=('PROPRIETARY')

# for CARCH in x86_64 aarch64; do;
#   pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=);
#   CARCH=$CARCH makepkg --verifysource --nobuild --noextract;
# done
# for CARCH in x86_64 aarch64; do;
#   echo "sha256sums_${CARCH}=("
#   [ "$CARCH" == aarch64 ] && CARCH=arm64
#   sha256sum "docker-scout_${pkgver}_${CARCH}.tar.gz" | sed -r 's|(\w+).+|  \1|';
#   echo ')'
# done

source_aarch64=("${pkgname}_${pkgver}_arm64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=(
  cf7b04b459e0db38d5d88176d55d52818d14a14409183b9ae77e100229f9835b
)
sha256sums_aarch64=(
  ba06ad34bf12d31bec02ea8237c18a0d06fb3a791e77ece51a527324c7fd5181
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
