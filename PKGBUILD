# Original Maintainer: Jonatan Bravo <zephrax@gmail.com>
# Maintainer: Hendrik "T4cC0re" Meyer <aur@t4cc0.re>
pkgname=tfenv
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Terraform version manager inspired by rbenv"
arch=("x86_64")
url="https://github.com/tfutils/tfenv"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("tfenv")
source=("https://github.com/tfutils/tfenv/archive/v${pkgver}.tar.gz")
validpgpkeys=()

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/local/bin"
	mkdir -p "${pkgdir}/usr/local/libexec"
	echo $srcdir
	ls -lah
	install -m755 "bin/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
	install -m755 "bin/terraform" "${pkgdir}/usr/local/bin/terraform"
	for i in `ls ${srcdir}/${pkgname}/libexec/`; do
		install -m755 "${srcdir}/${pkgname}/libexec/$i" "${pkgdir}/usr/local/libexec/$i"
	done
	chmod +x ${pkgdir}/usr/local/bin/${pkgname}
}
sha512sums=(9ec96f67f6c25d0bb93fa880da6e1fdd74d6a5f930b29c45779a878ddc547eb10d2e6bacbbd64ac9a2a11b90b022fff87cd861a20eb3a412e39812e26c92741f)
