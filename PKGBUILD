# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname='docker-scout'
pkgver=1.0.8
pkgrel=1
pkgdesc="Docker Scout is a set of software supply chain features integrated into Docker's user interfaces and command line interface (CLI)."
url='https://github.com/docker/scout-cli'
arch=('aarch64' 'x86_64')
license=('PROPRIETARY')

# for CARCH in x86_64 aarch64; do;
#   pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=);
#   CARCH=$CARCH makepkg --verifysource --nobuild --noextract;
#   echo "sha256sums_${CARCH}=("
#   sha256sum "docker-scout_${pkgver}_${CARCH}.tar.gz" | sed -r 's|(\w+).+|  \1|';
#   echo ')'
# done

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=(
  4bbc1d48f43ac308e6269a4fe88525f9726ffed8609d0fd490b6bf68374ab060
)
sha256sums_aarch64=(
  0e68b548b478668e30c09ff2272d23b51ce8db1734122fb7fb52ca5dc8732182
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
