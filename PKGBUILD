# Maintainer: WeepingDogel

pkgname=homepager
pkgver=1.2beta
pkgrel=1
pkgdesc='A simple homepage generator.'
url='https://github.com/NewAwkwardTools/homepager'
arch=('any')
license=('MIT')
depends=('python>=3.6' 'titlegetter' 'python-toml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('edefd622afa814b03a95873bdc37607d04866eef84af92ebdaa4fcf05de089eccb339c3360ea24dc6d541366cd35e8dff48c2c2b85f3cd783130eb6ff6e6ef3e')
package(){
    cd homepager-$pkgver
    install -Dm755 "homepager.py" -t "$pkgdir/usr/bin"
    mv "$pkgdir/usr/bin/homepager.py" "$pkgdir/usr/bin/homepager"
    install -Dm644 "config/config.toml" -t "$pkgdir/etc/homepager"   
    install -Dm644 "resources/style.css" -t "$pkgdir/usr/share/homepager"
    install -Dm644 "resources/index.js" -t "$pkgdir/usr/share/homepager"
    install -Dm644 "resources/searchbar.html" -t "$pkgdir/usr/share/homepager"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/homepager"
}
