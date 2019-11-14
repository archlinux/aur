# Maintainer: Kevin Azzam <aur@azz.am>

_pipname=django-widget-tweaks
pkgbase=python-django-widget-tweaks
pkgname=('python-django-widget-tweaks')
pkgver=1.4.5
pkgrel=1
pkgdesc="Tweak the form field rendering in templates, not in python-level form definitions. CSS classes and HTML attributes can be altered."
arch=('any')
url="https://github.com/jazzband/django-widget-tweaks/"
license=('MIT')
makedepends=('python-setuptools' 'python-django')
source=("https://github.com/jazzband/django-widget-tweaks/archive/${pkgver}.tar.gz")
sha256sums=('cc3f7fdd25e2919873c42c367eb5ab7c2c6774cf527ca644f7c9aa6cee887a2b')


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
