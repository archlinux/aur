# Maintainer: Ross Harrison <rtharrison86@gmail.com>

pkgname=djinni
pkgver=0.1
pkgrel=1
pkgdesc="Djinni is a tool for generating cross-language type declarations and interface bindings."
arch=('any')
url="https://github.com/dropbox/djinni"
license=('Apache 2.0')
depends=('python')

source=("$pkgname"::'git+https://github.com/dropbox/djinni.git')
sha512sums=('SKIP')

build() {
	# create runner
  echo "Create Runner"
 	cp ../djinni-simple.sh $pkgname/src/djinni-simple
	chmod +x $pkgname/src/djinni-simple
}

package(){
	# move package
  echo "Move Package"
  sudo rm -rf /usr/share/$pkgname
  sudo mv $pkgname /usr/share/$pkgname

	# link builds
  echo "Link Build"
	sudo ln -sf /usr/share/djinni/src/run /usr/bin/djinni
	sudo ln -sf /usr/share/djinni/src/djinni-simple /usr/bin/djinni-simple
}
