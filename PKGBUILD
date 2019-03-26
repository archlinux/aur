# Maintainer: Robin Broda <robin at broda dot me>

pkgname='ghidra'
pkgver=9.0.1
pkgrel=1
pkgdesc='A software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate'
arch=('x86_64')
url='https://ghidra-sre.org/'
license=('Apache')
depends=('java-environment>=11' 'bash')
optdepends=('python2: for the Python feature'
            'pam: for GhidraServer support')
source=('https://ghidra-sre.org/ghidra_9.0.1_PUBLIC_20190325.zip' 'ghidra')
sha256sums=('58ffa488e6dc57e2c023670c1dfac0469bdb6f4e7da98f70610d9f561b65c774'
            'd1eac99a2d868c35aecb0ce66eba5f3d244cfd715510cd324821a05148b664a2')

prepare() {
	cd "${pkgname}_${pkgver}"
}

package() {
	cd "${pkgname}_${pkgver}"

	install -Dm755 ../ghidra "${pkgdir}/usr/bin/ghidra"
	install -dm655 "${pkgdir}/opt/ghidra"
	cp -R * "${pkgdir}/opt/ghidra/"
	chmod -R a+r "${pkgdir}/opt/ghidra"
}
