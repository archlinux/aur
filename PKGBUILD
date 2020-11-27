# Maintainer: Harsh Barsaiyan <hbarsaiyan@gmail.com>

pkgname=('google-docs-online')
pkgver=1.0
pkgrel=1
pkgdesc="A launcher made using JAK to display Google Docs as native applications"
url="https://github.com/hbarsaiyan/google-docs-online"
depends=('jade-application-kit>=3.0.0')
license=('GPL3' 'CC')
arch=('any')
provides=('google-docs-online')
source=($pkgname-$pkgver.tar.gz::"https://github.com/hbarsaiyan/google-docs-online/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd $pkgname-$pkgver
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/{applications,pixmaps}
    cp launcher.desktop $pkgdir/usr/share/applications/google-docs-online.desktop
    cp icon.png $pkgdir/usr/share/pixmaps/googledocs.png
    install -Dm755 googledocs $pkgdir/usr/bin/google-docs-online
    printf '%s\n' '[bindings]' 'JAK_PREFERRED_BINDING=PyQt5' > $HOME/.config/jak.conf
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

