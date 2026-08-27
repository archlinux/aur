# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=tedit
_pkgauthor=RobertFlexx
_pkgname=tedit
pkgname=${_pkgname}-bin
pkgdesc="A command-line text editor inspired by ed/ex"

pkgver=2.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc' 'libstdc++' 'lua54')

source=("MANPAGE-${pkgver}.1::${_urlraw}/mandoc/${_appname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('ee40e92e36682b5dab45de79203be1aeccf77c190f0010113e4d1c6a7892a8c6'
            '152f6e42bdeaf0ca11bc1543b8751e7a541e40d02ad137457dab34f09461e325'
            'e765681d9c8c02828c6e27356b9579fea63c562c8d8afc3dd0671429821efcd0')
sha256sums_x86_64=('f2239985131da22ded69300de2fd6d21586c0db6c70d1ef07d8fb539891d1c10')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
