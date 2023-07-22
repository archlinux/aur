# Maintainer: SelfRef <arch@selfref.dev>

_basename=exscript
pkgname="python-${_basename}"
pkgver=2.6.28
pkgrel=1
pkgdesc="A Python module making Telnet and SSH easy "
arch=('any')
url="https://github.com/knipknap/exscript"
license=('MIT')
depends=('python' 'python-future' 'python-configparser' 'python-pycryptodomex' 'python-paramiko>=1.17')
makedepends=('git')
source=("${_basename}"::"git+https://github.com/knipknap/exscript.git#commit=4158f1eb631e7f08746a69cf12c80b3a1e05f1e6")
md5sums=('SKIP')

package(){
	cd ${_basename}
	make PREFIX="${pkgdir}/usr" install

	# already in python-future
	rm -f "${pkgdir}/usr/bin/futurize"
	rm -f "${pkgdir}/usr/bin/pasteurize"
}