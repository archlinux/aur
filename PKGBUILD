# Maintainer: Anton Batenev <antonbatenev@yandex.ru>

pkgname=ydcmd
pkgver=2.3
pkgrel=1
pkgdesc='Command line client for Yandex.Disk'
arch=('any')
url='https://github.com/abbat/ydcmd'
license=('BSD')
depends=('python>=2.6' 'python-dateutil')
makedepends=('python>=2.6' 'git')
optdepends=(
    'ca-certificates: ssl certificates validation'
    'python-progressbar: pretty console upload/download progressbar'
)
source=("git+https://github.com/abbat/ydcmd.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/pyshared

	install -D -m755 ${srcdir}/${pkgname}/ydcmd.py         ${pkgdir}/usr/share/pyshared/${pkgname}.py
	install -D -m644 ${srcdir}/${pkgname}/man/ydcmd.1      ${pkgdir}/usr/share/man/man1/${pkgname}.1
	install -D -m644 ${srcdir}/${pkgname}/man/ydcmd.ru.1   ${pkgdir}/usr/share/man/ru/man1/${pkgname}.1
	install -D -m644 ${srcdir}/${pkgname}/man/ydcmd.tr.1   ${pkgdir}/usr/share/man/tr/man1/${pkgname}.1
	install -D -m644 ${srcdir}/${pkgname}/README.md        ${pkgdir}/usr/share/doc/${pkgname}/README.md
	install -D -m644 ${srcdir}/${pkgname}/README.en.md     ${pkgdir}/usr/share/doc/${pkgname}/README.en.md
	install -D -m644 ${srcdir}/${pkgname}/README.tr.md     ${pkgdir}/usr/share/doc/${pkgname}/README.tr.md
	install -D -m644 ${srcdir}/${pkgname}/ydcmd.cfg        ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.cfg
	install -D -m644 ${srcdir}/${pkgname}/debian/copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	ln -s /usr/share/pyshared/${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}
