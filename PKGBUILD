# Maintainer: Elovsky Valentin (evvsoft@gmail.com)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='ivideon-client'
pkgver='6.0.3'
pkgrel='153'
pkgdesc='Ivideon Client'
arch=('x86_64')
url=('http://ivideon.com/')
license=('freeware')
depends=('qt5-base' 'qt5-script' 'qt5-svg' 'openssl' 'wget' 'vlc')
makedepends=('libarchive')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}.${pkgrel}_amd64.deb"
    'ivideon.install'
    'ivideon-client.desktop')
sha256sums=("c4c195df7e9c96e4f0fedd3725842212b5d7fe2b8bbf28bc15cbde363c6272b0"
        'f2089a4109ef8e8516afedfce41c78d6be016d50941f4cc63850cd82e97a73ef'
        '2baf7178b17057d0e638d19c1c3feb17e8eb65ea32106d477f9d53e24937020b')
install='ivideon.install'


build() {
  cd "$srcdir"
  bsdtar xf "$srcdir/data.tar.gz"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  cp -dpr --no-preserve=ownership "$srcdir/opt" "$pkgdir"
  install -Dm 644 "$srcdir/ivideon-client.desktop" "$pkgdir/usr/share/applications/ivideon-client.desktop"
}