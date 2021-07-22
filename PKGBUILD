# Maintainer: Matthieu Borde <starmatt at free dot fr>

pkgname=gnome-shell-extension-windowisready_remover
_pkgname=WindowIsReady_Remover
pkgver=1.12
pkgrel=1
pkgdesc='GNOME shell extension that removes the annoying "Windows is Ready" notification.'
arch=(any)
url='https://github.com/nunofarruca/WindowIsReady_Remover'
license=('unknown')
depends=('gnome-shell')
source=("https://github.com/nunofarruca/WindowIsReady_Remover/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2d29638425a266f2b4a9aff16a0c7cc8716974dea5206cae933a05763513be46')

package() {
    _uuid="windowIsReady_Remover@nunofarruca@gmail.com"
    _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    cd "$_pkgname-$pkgver/$_uuid"
    install --directory "$_destdir/schemas"
    install --target-directory "$_destdir" --mode 644 metadata.json *.js
    install --target-directory "$_destdir/schemas" --mode 644 schemas/*
}
