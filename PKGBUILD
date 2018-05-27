# Maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Matthias Maennich < arch .at. maennich.net >
# Contributor: bruce < b_a_g99 .at. hotmail.com >
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=dropbox-cli
pkgver=2015.10.28
pkgrel=3
pkgdesc='Command line interface for dropbox'
arch=('any')
url='http://www.dropbox.com'
license=('GPL')
install='dropbox-cli.install'
depends=('python2' 'dropbox')
source=("https://linux.dropbox.com/packages/dropbox.py"
        "$pkgname-arch.patch")
sha256sums=('578bbcbb025db47581c962ddd95387b1078196857b3a76e9594b15b30325ae7d'
            '1fbaaf044393394e8d7a7457c1ae556e31fa41897219dc9cbe0b1bb6927b6c89')

build(){
    mkdir -p "$srcdir/build"
    cp -L "$srcdir/dropbox.py" "$srcdir/build/"
    cd "$srcdir/build"
    patch -i "$srcdir/$pkgname-arch.patch"
}

package() {
    install -D -m 755 "$srcdir/build/dropbox.py" "$pkgdir/usr/bin/dropbox-cli"
}
