# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname='docker-scout'
pkgver=1.2.2
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
#   [ "$CARCH" == aarch64 ] && CARCH=arm64
#   echo "sha256sums_${CARCH}=("
#   sha256sum "docker-scout_${pkgver}_${CARCH}.tar.gz" | sed -r 's|(\w+).+|  \1|';
#   echo ')'
# done

source_aarch64=("${pkgname}_${pkgver}_arm64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=(
  6b685afc55202138b1bc18ff83a8c8072cedd9958f0a3aaec2f418ca77aaf3b5
)
sha256sums_arm64=(
  982443373d3fb31a3611a695ba778b59c67638ef8b9d27643efa358e8cd39cfa
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
