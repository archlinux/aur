# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>
pkgname=pencil
pkgver=3.0.2
pkgrel=2
pkgdesc="Sketching and GUI prototyping/wireframing tool"
arch=('any')
license=('GPL2')
url="http://github.com/evolus/pencil"
source=("https://github.com/evolus/pencil/archive/v$pkgver.tar.gz")
sha256sums=('afcbd3809e0ff4ca03579d8cc5123e4bedccf759a76e6f8d2187c62e1e97a6dc')
depends=('nodejs' 'npm')
optdepends=('pencil-android-lollipop-stencils-git: Android UI'
            'pencil-material-icons-git: Material Design Icons')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    npm install
    node_modules/.bin/build --linux dir

    install -d "$pkgdir/usr/share/$pkgname/" "$pkgdir/usr/bin"
    cp -r dist/linux-unpacked/* "$pkgdir/usr/share/$pkgname/"
    ln -s "/usr/share/$pkgname/pencil" "$pkgdir/usr/bin/"
}
