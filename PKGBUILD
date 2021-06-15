# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-django-recaptcha-git"
pkgver=2.0.6.r7.gdc7cbfe
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
url="https://github.com/praekelt/django-recaptcha"
license=("BSD3")
arch=("any")
provides=("python-django-recaptcha")
depends=("python-django")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "django-recaptcha"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "django-recaptcha"
 python setup.py build
}

package(){
 cd "django-recaptcha"
 python setup.py install --root="$pkgdir" --optimize=1
}
