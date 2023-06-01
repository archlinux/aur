_pkgname=meg
pkgname=meg-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="Fetch many paths for many hosts - without killing the hosts"
arch=(x86_64)
url="https://github.com/tomnomnom/meg"
license=(MIT)
provides=(meg)
conflicts=(meg)
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-0.3.0.tgz")
source=("$pkgname-$pkgver-README.mkd::https://raw.githubusercontent.com/tomnomnom/meg/5cc1d344ce2c29f8c88f183dd70072a17f3d759a/README.mkd"
        "$pkgname-$pkgver-CONTRIBUTING.mkd::https://raw.githubusercontent.com/tomnomnom/meg/a7831bf6652e93501c0fa8fb869095b06e02d45c/CONTRIBUTING.mkd"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/tomnomnom/meg/a7831bf6652e93501c0fa8fb869095b06e02d45c/LICENSE")
b2sums_x86_64=('79eaee8a5d7680f61445e4b2546eaeeade7629b1d2b373305d99c5d9ec58dbda19d6e6a0ca332de8cdb43d02e9c3fc06045dca49b2ef77ae702aa163d238b31c')
b2sums=('428b0061466b5a5c03a5121b5554ba12291491dbf7e03648732e59f83054e219d4810fde26e9117efadd334aa8b760cc5470c0e36a44d45e76a49cfceea602a5'
        '74291a32964c7cbf4fcb3c6e8e54efd8cab45bc0866d50aadea46301d6528f57f2d1b6db63d1d54f6e1cffb6a6f36de7eed668e88c1a5857accd5e8e9dc4fc0d'
        '0c051ae927fed241539370bddc8e52c612f14cb46d69c3fe924254c4d00a7f02ac9fae8d7f29125ab3e31f46db36bf5a0aeebb8d9bbbd0d2606bad35e142f1d4')

package() {
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $pkgname-$pkgver-README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 $pkgname-$pkgver-CONTRIBUTING.mkd "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
	install -Dm644 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
