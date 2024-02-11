# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-widget-tweaks
pkgbase=python-django-widget-tweaks
pkgname=('python-django-widget-tweaks')
pkgver=1.5.0
pkgrel=1
pkgdesc="Tweak the form field rendering in templates, not in python-level form definitions. CSS classes and HTML attributes can be altered."
arch=('any')
url="https://github.com/jazzband/django-widget-tweaks/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://github.com/jazzband/django-widget-tweaks/archive/${pkgver}.tar.gz")
sha256sums=('ccf05e50a18431cde8d06ec170619bfb305025ab81fed85e68eb5c220fa9edeb')


build() {
    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django')

    cd "${srcdir}/${_pipname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
