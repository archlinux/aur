# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Shaw <puxx@mail.ustc.edu.cn>
# Contributor: Nick <iglu.sitar at gmail dot com>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=ipbt
pkgver=20210215.5a9cb02
pkgrel=1
pkgdesc='A high-tech ttyrec player'
arch=('x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/${pkgname}"
license=('MIT')
depends=('ncurses' 'perl')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0aeafaacbccb89d2aaf044d6c6582c71cb66f607847854f2df514a21f6a5cb70')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 ipbt "${pkgdir}/usr/bin/ipbt"
  install -Dm755 ttydump "${pkgdir}/usr/bin/ttydump"
  install -Dm755 ttygrep "${pkgdir}/usr/bin/ttygrep"
  install -Dm644 ipbt.1 "${pkgdir}/usr/share/man/man1/ipbt.1"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}

