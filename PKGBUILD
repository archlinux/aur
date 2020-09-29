# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-desktop
pkgver=4.0.0
# sometimes, they release without bumping the version
_release=20200928
_licenserelease=20200928
pkgrel=1
pkgdesc='TETR.IO desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
source=("$pkgname-$pkgver-$_release.deb::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        "LICENSE-$_licenserelease.html::https://tetr.io/about/terms/")
sha256sums=('54a8ed7eb5babf9ede22a3a59556241005cb6de7f06f4dbde00308f26f521e36'
            'caab771d948c7bf8cc924481dceaae9f6174d74ce70f5a0d7e8433525665eccf')

package() {
    cd "$srcdir"

    tar -xf data.tar.xz -C "$pkgdir"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 "LICENSE-$_licenserelease.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

    chmod -R go-w "$pkgdir"
}
