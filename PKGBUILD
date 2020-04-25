# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-widget-tweaks
pkgbase=python-django-widget-tweaks
pkgname=('python-django-widget-tweaks')
pkgver=1.4.8
pkgrel=1
pkgdesc="Tweak the form field rendering in templates, not in python-level form definitions. CSS classes and HTML attributes can be altered."
arch=('any')
url="https://github.com/jazzband/django-widget-tweaks/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://github.com/jazzband/django-widget-tweaks/archive/${pkgver}.tar.gz")
sha256sums=('0404c070c409735210a7c3da55ce52c4a11c48beb7ad046552ccde62598797c4')


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
