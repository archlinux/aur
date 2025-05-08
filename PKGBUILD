# Maintainer: mbutsk <mbutsk@icloud.com>

pkgname=pyhoster
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple tool for servers that host python projects"
arch=('any')
url="https://github.com/mbutsk/pyhoster"
license=('MIT')
depends=(python3 python-psutil)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz"
        "https://github.com/mbutsk/pyhoster/raw/refs/heads/main/pyhoster.8")
sha256sums=('501f29d024a29e36530c8ebd924d000585f14f33ec5801a8d8960589298063ed'
            '1acf4ed367126422895e1618ebf9a621ccfb854f71be75e69a13ba1ec18ae760')
conflicts=(pyhoster-git)

package() {
    install -D pyhoster.8 -t $pkgdir/usr/share/man/man8
    cp -r $pkgname-$pkgver/pyhoster $pkgdir/usr/share
    chmod +x $pkgdir/usr/share/pyhoster/main.py
    mkdir -p $pkgdir/usr/bin
    ln -s $pkgdir/usr/share/pyhoster/main.py $pkgdir/usr/bin/pyhoster
}