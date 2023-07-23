pkgname=degourou
pkgver=1.3.8
pkgrel=2
pkgdesc="Automate the process of getting decrypted ebook from InternetArchive without the need for Adobe Digital Editions and Calibre"
url="https://gitea.com/bipinkrish/DeGourou"
arch=('any')
license=('GPL')
depends=('python-pycryptodomex' 'python-lxml' 'python-cryptography' 'python-charset-normalizer')
#source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bipinkrish/DeGourou/-/archive/v$pkgver/DeGourou-v$pkgver.tar.gz" "starter.py")
source=("$pkgname-$pkgver.tar.gz::https://gitea.com/bipinkrish/DeGourou/archive/v${pkgver}.tar.gz" "starter.py")
sha256sums=('e22d58904707212449c94fcc8611e3fee2af3e1849dae1b92cc928e48cd47c98'
            '63605649733abe631608c8a6a2a4150bcb17f96e5f9eab6cc5e1401660702867')

package() {
    cd "$srcdir/degourou"
    # copy files
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -R DeGourou.py setup decrypt "$pkgdir/opt/$pkgname/"
    install -Dm755 ../starter.py "$pkgdir/usr/bin/degourou"
}
