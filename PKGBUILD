# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Scott Horowitz <stonecrest[at]gmail[dot]com>

_pkgname=sonata
pkgname=sonata-git
pkgver=v1.7a2.r77.g4e34e07
pkgrel=1
pkgdesc='Elegant GTK+3 music client for MPD (Git Version)'
url='https://github.com/multani/sonata'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python>=3.2' 'python-gobject>=3.7.4' 'gtk3>=3.4' 'python-mpd2>=0.4.6')
makedepends=('git')
optdepends=('python-tagpy: metadata editing support'
            'python-dbus: multimedia keys support')
conflicts=('sonata' 'sonata-svn')
provides=('sonata')
source=(git+git://github.com/multani/sonata.git)
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_pkgname}"
	git describe | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package()
{
	cd "${srcdir}/${_pkgname}"
	python setup.py install --prefix=/usr --optimize 1 --root="${pkgdir}"
}
