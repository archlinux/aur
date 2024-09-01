# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=2
pkgdesc='A modern watch command, binary version'
url="https://github.com/sachaos/viddy"
arch=('x86_64' 'i686' 'aarch64')
source=("LICENSE" "README.md")
license=('MIT')
depends=('glibc')
conflicts=('viddy')
provides=('viddy')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-i686.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('e6eea22d4e9e0aa6a78d0f9126009ec041ea047f94b320c003c34a631821f953'
            '4f310b4e7c557197f6ccd1ab6214a0995b08bbb97bcfea15e788dd0ec43ceb86')
sha256sums_x86_64=('cfb5f2403cb1256af00ca61e48015cd66063c66e4aeb458e130989eecafad51f')
sha256sums_i686=('786cfe9b655562b898f899858e7ea28093eb4e2dab9c087c95fbddc57bb2bda4')
sha256sums_aarch64=('08f36cdff8d77cbb6775c7330185f929e5edc12b5ab790437ce7db5ede6a7d38')

package() {
  cd "$srcdir/"

  install -Dm755 viddy "${pkgdir}/usr/bin/viddy"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
