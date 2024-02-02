# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-git-revision-date-localized-plugin"
pkgver=1.2.3
pkgrel=1
pkgdesc="MkDocs plugin to add a last updated date to your site pages"
url="https://github.com/timvink/mkdocs-git-revision-date-localized-plugin/"
license=('MIT')
arch=("any")
conflicts=("python-mkdocs-git-revision-date-localized-plugin")
replaces=("python-mkdocs-git-revision-date-localized-plugin")
depends=("mkdocs" "python-gitpython" "python-babel>=2.7.0" "python-pytz")
makedepends=("pyhon-build" "python-setuptools" "python-wheel" "python-package")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c06fa5193cb965b5b4d9b4d7c78949c0d85533ab6d60a76352cea404e9d2cab87d81647824ea13265f3be196ed79f1aba347e03b833e796c25a4373316dcf21d')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
