# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Hendrik Luup <hendrik at luup dot info>

pkgname=dvorakng
pkgver=0.6.2
pkgrel=2
pkgdesc="A Dvorak typing tutor. It's heavily based on Dvorak7min, but adds many improvements."
url='https://gitlab.com/atsb/dvorakng'
license=('GPL')
makedepends=('make' 'gcc')
source=("https://gitlab.com/atsb/${pkgname}/repository/archive.tar.gz?ref=${pkgver}")
sha512sums=('622a1c107f0d650209ff588190e96d08ca61500cd9ea6c286f43ea98b152afe41e7c3772ff15d2acacca8ba9e723cf5ac52a8ef4ea22713924fee8044a0f2613')
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-"*
	make || return 1
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-"*"/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

