# Maintainer: Andrew Bates <andrew dot bates at cantab dot net>

pkgname=lightdm-kbswitch-greeter-git
_pkgname=lightdm-kbswitch-greeter
pkgver=0.1.r1.gfd79f5e
pkgrel=5
pkgdesc="Python and Gtk+ greeter for LightDM"
arch=('any')
url="https://github.com/bearvrrr/lightdm-kbswitch-greeter"
license=('GPL3')
depends=('python-gobject' 'gobject-introspection' 'lightdm' 'gtk3')
optdepends=('lightdm-gtk-greeter: session badge icons')
makedepends=('git' 'python-distutils-extra')
source=("${_pkgname}"::'git+https://github.com/bearvrrr/lightdm-kbswitch-greeter.git')
md5sums=('SKIP')
provides=('lightdm-kbswitch-greeter')
conflicts=('lightdm-kbswitch-greeter')
backup=('etc/lightdm/lightdm-kbswitch-greeter.conf')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

package() { 
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
