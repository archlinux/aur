# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-classic
pkgver=v1.1.0
_ver=${pkgver#v}
_gitver=${_ver%.*}
pkgrel=1
pkgdesc='Official Bitcoin Classic binaries: bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt'
arch=('i686' 'x86_64')
url="https://bitcoinclassic.com/"
license=('MIT')
depends=('boost-libs' 'openssl' 'miniupnpc' 'protobuf' 'qrencode' 'qt5-base')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source_i686=("https://github.com/bitcoinclassic/bitcoinclassic/releases/download/$pkgver/bitcoin-$_ver-linux32.tar.gz"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/bitcoin-qt.desktop"
						 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/share/pixmaps/bitcoin128.png"
						 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoind.1"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoin-cli.1"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoin-qt.1"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoin.conf.5"
						 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/COPYING")
source_x86_64=("https://github.com/bitcoinclassic/bitcoinclassic/releases/download/$pkgver/bitcoin-$_ver-linux64.tar.gz"
               "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/bitcoin-qt.desktop"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/share/pixmaps/bitcoin128.png"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoind.1"
               "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoin-cli.1"
               "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoin-qt.1"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/contrib/debian/manpages/bitcoin.conf.5"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_gitver/COPYING")
md5sums_i686=('b23fe9936df44bd3e976702cc6ecd4f3'
              '0aa8db6ac0e58ccbe85d0fe4923fb39e'
              '0aae5f0110179e8e1d588530bcce5d2a'
              'a7f496d6996a60a20c2ef025da65773a'
              '2bfcee41b958f1c4ff9968669236fe3a'
              'ca3af56933093fd074423eea32c1d650'
              '844dd4c73f9837a6d4fc7db44d67104e'
              'b44a28f73a201403cabb5e0a49e6d1e6')
md5sums_x86_64=('9a3b253cf5292ef50ff0b54d1daffa66'
                '0aa8db6ac0e58ccbe85d0fe4923fb39e'
                '0aae5f0110179e8e1d588530bcce5d2a'
                'a7f496d6996a60a20c2ef025da65773a'
                '2bfcee41b958f1c4ff9968669236fe3a'
                'ca3af56933093fd074423eea32c1d650'
                '844dd4c73f9837a6d4fc7db44d67104e'
                'b44a28f73a201403cabb5e0a49e6d1e6')
sha256sums_i686=('6648db9f7a2b851a7d2422cbfa5631c7ba23af7da825de00c9c78be370b50bf1'
                 'b65b377c0d9ecae9eea722843bca0add6bdb7e50929a7e1f751b79b6621c6073'
                 'ad880c8459ecfdb96abe6a4689af06bdd27906e0edcd39d0915482f2da91e722'
                 '7d090ddd485c36d4fae5e6627388c5550f824fd498d5fd958ec999857fff7b28'
                 '52e104ba55d5f564c849a72c67b27c9ec3b1dea6e6dbf931f4ae30d182e9a135'
                 '60a3396e98c24f0599c997edd2c34c414414fffbde84bbe0e4573435dc5bb417'
                 '7f4021e34d52c321f679b548fcf6d55b4da30077b7aed392976f048ab88dcdd1'
                 '44c9d9ad9237f8dafd4633a51535fa75c0b28690043f5279f4976504c917966d')
sha256sums_x86_64=('67a7fba1beccc490be9d92913de632eed96259fba92b6a318321b0b2f247316b'
                   'b65b377c0d9ecae9eea722843bca0add6bdb7e50929a7e1f751b79b6621c6073'
                   'ad880c8459ecfdb96abe6a4689af06bdd27906e0edcd39d0915482f2da91e722'
                   '7d090ddd485c36d4fae5e6627388c5550f824fd498d5fd958ec999857fff7b28'
                   '52e104ba55d5f564c849a72c67b27c9ec3b1dea6e6dbf931f4ae30d182e9a135'
                   '60a3396e98c24f0599c997edd2c34c414414fffbde84bbe0e4573435dc5bb417'
                   '7f4021e34d52c321f679b548fcf6d55b4da30077b7aed392976f048ab88dcdd1'
                   '44c9d9ad9237f8dafd4633a51535fa75c0b28690043f5279f4976504c917966d')

package() {
  msg2 "Installing binaries..."
  for i in -cli d -qt -tx; do install -Dm 755 $srcdir/bitcoin-$_ver/bin/bitcoin$i \
  $pkgdir/usr/bin/bitcoin$i; done

  msg2 'Installing license...'
  install -Dm 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  msg2 "Installing man pages..."
  install -Dm 644 "$srcdir/bitcoind.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "$srcdir/bitcoin-cli.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "$srcdir/bitcoin-qt.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "$srcdir/bitcoin.conf.5" -t "$pkgdir/usr/share/man/man5"

	msg2 'Installing icon...'
	install -Dm 644 "$srcdir/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"

	msg2 'Installing desktop file...'
	mv "$srcdir/bitcoin-qt.desktop" "$srcdir/bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"
}
