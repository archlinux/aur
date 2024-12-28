# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=formiko
pkgver=1.5.0
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD-3-Clause')
arch=('any')
makedepends=('python-setuptools')
depends=('gobject-introspection-runtime' 'gtk3' 'gtksourceview4' 'gtkspell3'
         'hicolor-icon-theme' 'python' 'python-docutils' 'python-gobject' 'webkit2gtk-4.1')
optdepends=('python-recommonmark: for Common Mark support (MarkDown)'
            'python-pygments: for syntax color in html output code blocks')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/ondratu/formiko/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2d0fd315cc9e1ef9c113a752a3e618dc27d2127227c199323d4002ecf3c04622')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
