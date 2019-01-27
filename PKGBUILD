# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-widget-tweaks
pkgbase=python-django-widget-tweaks
pkgname=('python-django-widget-tweaks')
pkgver=1.4.3
pkgrel=1
pkgdesc="Tweak the form field rendering in templates, not in python-level form definitions. CSS classes and HTML attributes can be altered."
arch=('any')
url="https://github.com/jazzband/django-widget-tweaks/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://github.com/jazzband/django-widget-tweaks/archive/${pkgver}.tar.gz")
sha256sums=('8ac4176b5c09fe228f9495a4309e9b681e5d46afa236d32e51ae9e22c6992282')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "LICENSE.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
