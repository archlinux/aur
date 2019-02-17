# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=tracer
pkgver=0.7.1
pkgrel=1
pkgdesc='Finds outdated running applications in your system'
arch=('any')
url='http://tracer-package.com/'
license=('GPL2')
depends=('python-beautifulsoup4' 'python-psutil' 'python-lxml' 'python-dbus' 'pyalpm')
optdepends=("python-argcomplete: bash completion")
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrostyX/tracer/archive/tracer-$pkgver-1.tar.gz"
        'tracer.hook')
sha256sums=('97b01e5753f3ac94fda9c61ca2dc2e6e50ede2ba3d72784b8be4a174e35e3200'
            'cade46472c45fef3f8ec1eb762cd4469d37f2966f65f63ee89887941e7896452')

package() {
  cd tracer-tracer-$pkgver-1
  python setup.py install --root="$pkgdir/" --optimize=1

  # try to run as last/late hook
  install -Dm0644 ../tracer.hook "$pkgdir"/usr/share/libalpm/hooks/zzz-tracer.hook
}
