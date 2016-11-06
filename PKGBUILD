# Maintainer: Michał Sałaban <michal@salaban.info>
name=python2-creole
pkgname=$name-hg
pkgver=31.1c3fc0663ba8
pkgrel=1
pkgdesc='WikiCreole is a markup language for wikis'
arch=('any')
url='https://bitbucket.org/thesheep/wikicreole/wiki/Home'
license=('BSD')
depends=('python2')
provides=($name)
source=("hg+https://bitbucket.org/thesheep/wikicreole")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/wikicreole
	echo $(hg identify -n).$(hg identify -i)
}

package() {
	cd $srcdir/wikicreole
	python2 setup.py install --prefix=/usr --root="${pkgdir}/"
}
