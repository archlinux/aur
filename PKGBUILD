# Maintainer: luzea <me at luzea dot de>

pkgname='smartversion'
pkgver=3.82
pkgrel=2
pkgdesc='SmartVersion is a tool for storing multiple versions of your files inside SmartVersion Files (SVF files).'
arch=('x86_64')
url='https://smartversion.com'
license=('custom:smartversion')
source=('smartversion-3.82-x64.zip::https://smartversion.com/smartvs382_linux_x64.zip')
sha256sums=('a34e70f8415edc3729810fcb8baa11036b36cc6beb0e47e8f37a9e071972e2e3')

prepare() {
    echo 'SmartVersion is a shareware product. You may copy, distribute, and try it for free, but if you use for longer than the evaluation period, you must register. You will receive a valid license, a registration code and the latest release.' > LICENSE
}

package() {
    install -Dm755 smv "$pkgdir/usr/bin/smv"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
