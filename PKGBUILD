# Maintainer: Armando Ibarra <armandoibarra1@gmail.com>
# Contributor: flaketill <armandoibarra1 at gmail dot com>

pkgname=flaketill-says
pkgver=0.0.1
pkgrel=2

pkgdesc="An app for your console to proyects manager, for example if you write on your \
console application flaketill says: What do yo do? In 
the future i'll build an app like jarvis but for moment is a dream"
arch=('x86_64')
url="https://artpcweb.appspot.com/"
license=('GPL')

depends=('python2' 'espeak')
checkdepends=('bash')
makedepends=('lxterminal' 'terminator' 'namcap')
optdepends=('gksu: sudo-save support',
			'alsa-lib: sound support')

#source_x86_64=("https://raw.githubusercontent.com/flaketill/flaketill-says/testing/dist/aur/flaketill-says")

install=${pkgname}.install

#source=("$pkgname-$pkgver.tar.gz"
#        "$pkgname-$pkgver.patch")

source=("${pkgname}.desktop"
		"$pkgname"
		"LICENSE")

md5sums=('b92a253536ce1275a8c91d6ed9d7b2f7'
         'ccc2acc3cf18f71c517e42fc2eb4d77b'
         '985eca66feaf0170850231d4616b3074')

build() {
	
	#cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	#make

	cd "${srcdir}"
}

check() {
	
	#cd "$pkgname-$pkgver"
	#make -k check

	cd "${srcdir}"
	#check if exist files base

	#if [ -f "${pkgname}"" ]; then
	#	if [ -f "${pkgname}.desktop"]; then
	#		exit 1
	#	fi
	#else
	#	exit 0
	#fi
}

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/bin"

	#cp --preserve=mode -r "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/applications"

	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -Dm755 ${pkgname} "$pkgdir"/usr/bin/${pkgname}

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
