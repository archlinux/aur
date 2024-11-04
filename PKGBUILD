# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname='docker-scout'
pkgver=1.14.0
pkgrel=1
pkgdesc="Docker Scout is a set of software supply chain features integrated into Docker's user interfaces and command line interface (CLI)."
url='https://github.com/docker/scout-cli'
arch=('aarch64' 'x86_64')
license=('PROPRIETARY')

# for CARCH in x86_64 aarch64
# do
#   pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=)
#   CARCH=$CARCH makepkg --verifysource --nobuild --noextract
# done
# for CARCH in x86_64 aarch64
# do
#   echo "sha256sums_${CARCH}=("
#   [ "$CARCH" == aarch64 ] && CARCH=arm64
#   sha256sum "docker-scout_${pkgver}_${CARCH}.tar.gz" | sed -r 's|(\w+).+|  \1|'
#   echo ')'
# done

source_aarch64=("${pkgname}_${pkgver}_arm64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=(
  9dd20de30124cf88126d9c8798742916daec2ac7b26a57b3b20f62648f1eb44b
)
sha256sums_aarch64=(
  fff9834899a6e1a45aaa18a03b0b079baad64c83ea5027000b59b5424bc10638
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
