pkgbase=cura-bin
pkgname=cura-bin
pkgver=3.2
pkgrel=4
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker. This package contains both the binary Cura engine and the python front-end."
depends=('python>=3.5' 'python-pyqt5' 'curaengine' 'uranium' 'libarcus-git' 'python-numpy' 'python-scipy' 'protobuf' 'python-pyserial' 'python-sip')

replaces=('cura')
conflicts=('libarcus' 'cura', 'cura-git')
url="https://github.com/Ultimaker/Cura"
license=('AGPLv3')
arch=('x86_64')
debver=3.2.0~201802101704~rev2728~pkg200~ubuntu18.04.1
sha1sums=('45c9290bca87299ffc627d6b809360eac4c722da' '87e068e5706ed99110ef71dd57fe52ee1b783b53')
if [ "$CARCH" == x86_64 ]; then
	source+=(https://launchpad.net/~thopiekar/+archive/ubuntu/cura/+build/14333835/+files/cura_${debver}_all.deb)
	sha256sums+=('44949e64355f526ccde6f111c2bc339c041a52c218e153f3fead85e50d420998')
fi

install=.install

build()
{
	cd "${srcdir}"
	
	# unpack
	if [ -f data.tar.xz ]; then
		tar --xz -xf data.tar.xz
	elif [ -f data.tar.gz ]; then
		tar -xzf data.tar.gz
	fi
}

package()
{	
	cp -r "${srcdir}"/usr "${pkgdir}"/usr
}


