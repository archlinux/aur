# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname='docker-scout'
pkgver=1.7.0
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
  ec38faa6f5f63acf05d09595261f98c127cfee31896f5946eb0121c632d0a3a8
)
sha256sums_aarch64=(
  0f5b5cef7d116fdba06bb57b6f1bc7c551f46c96f6e5371ca8eca2f3beffb59e
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
