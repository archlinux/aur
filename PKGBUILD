# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>

pkgname="beancount-import-git"
pkgver=r369.59615a5
pkgrel=1
pkgdesc="Semi-automatic importer from external data sources into beancount"
url="https://github.com/jbms/beancount-import"
arch=("any")
license=("MIT")
depends=("beancount"
         "python"
         "python-atomicwrites"
         "python-dateutil"
         "python-jsonschema"
         "python-nltk"
         "python-numpy"
         "python-scipy"
         "python-scikit-learn"
         "python-tornado"
         "python-watchdog")
makedepends=("git" "npm" "python-build" "python-installer" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "beancount-import"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "beancount-import"
 python -m build --wheel --no-isolation
}

package(){
 cd "beancount-import"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
