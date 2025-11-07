# Maintainer: FTS427 <FTS427@outlook.com>
# Python package author: Vincent Wu <magicdroidx@gmail.com>
pkgname=python-endstone_bstats
pkgver=0.1.0
pkgrel=2
pkgdesc="bStats Metrics for Endstone Plugins"
arch=(any)
url="https://github.com/EndstoneMC/bstats"
license=('MIT')
makedepends=('python' 'python-pip')
build() {
    pip install --no-deps --target="endstone_bstats" endstone_bstats==0.1.0
}
package() {
    sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
    mkdir -p "$pkgdir/$sitepackages"
    cp -r "$srcdir/endstone_bstats/*" "$pkgdir/$sitepackages"
}
