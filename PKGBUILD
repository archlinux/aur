# Maintainer: Harsh Barsaiyan <hbarsaiyan@gmail.com>

pkgname=('google-docs-online')
pkgver=1.0
pkgrel=0
pkgdesc="With Google Docs, you can write, edit, and collaborate wherever you are."
url="https://docs.google.com/document/u/0/"
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

