# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=purr-adb
pkgver=2.0.4
pkgrel=1
pkgdesc="Browse and search Android logcat output with fzf"
arch=('any')
url="https://github.com/google/purr"
license=('Apache-2.0')
depends=('android-tools' 'fzf' 'perl' 'zsh')
conflicts=('purr')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ce8b4d31d6b56e79808f12a37795ea15127f3e01eb94f2becb1ee1cd8724844a')

build() {
  cd "purr-${pkgver}"
  make purr
}

package() {
  cd "purr-${pkgver}"
  install -Dm755 out/purr -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
