pkgname=degourou
pkgver=1.3.8
pkgrel=1
pkgdesc="Automate the process of getting decrypted ebook from InternetArchive without the need for Adobe Digital Editions and Calibre"
url="https://gitea.com/bipinkrish/DeGourou"
arch=('any')
license=('GPL')
depends=('python-pycryptodomex' 'python-lxml' 'python-cryptography' 'python-charset-normalizer')
#source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bipinkrish/DeGourou/-/archive/v$pkgver/DeGourou-v$pkgver.tar.gz" "starter.py")
source=("$pkgname-$pkgver.tar.gz::https://gitea.com/bipinkrish/DeGourou/archive/v${pkgver}.tar.gz" "starter.py")
sha256sums=('e22d58904707212449c94fcc8611e3fee2af3e1849dae1b92cc928e48cd47c98'
            '515dc7cb110c904794183f4c95765d68b683c17316c1d425fb4cf1db07afa034')

package() {
    cd "$srcdir/DeGourou-v$pkgver"
    # copy files
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -R DeGourou.py setup decrypt "$pkgdir/opt/$pkgname/"
    install -Dm755 ../starter.py "$pkgdir/usr/bin/degourou"
}
