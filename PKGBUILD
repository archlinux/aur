# Maintainer: Jonas Bewig <jomosoto@proton.me>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Based on protonvpn-cli-ng by Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-community
_oldpkgname=protonvpn-cli-ng
pkgver=2.2.12
pkgrel=1
pkgdesc="A Community Linux CLI for ProtonVPN"
arch=("any")
url="https://github.com/ProtonVPN/linux-cli-community"
license=("GPL3")
depends=("openvpn" "dialog" "python-pythondialog" "python-setuptools"
		 "python-docopt" "python-requests" "python-jinja" "python-distro")
provides=("${_oldpkgname}")
conflicts=("protonvpn-cli" "protonvpn-gui" "${_oldpkgname}")
replaces=("${_oldpkgname}")
source=("linux-cli-community-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('586b34fb87ad0823fc24643c7b460acef517da4257b1330c9064009ec1215168')

package() {
	cd "linux-cli-community-${pkgver}"
	python setup.py install --optimize=1 --root="${pkgdir}"
}
