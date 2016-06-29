# Maintainer: Pasquale Boemio <boemianrapsodi@gmail.com>

pkgname=omnisharp
pkgver='1.9_alpha13'
pkgrel=0
pkgdesc="cross platform .NET development!"
arch=('i686' 'x86_64')
url="http://www.omnisharp.net/"
license=('custom' 'GPL2' 'LGPL2.1')
depends=('mono')
source=(omnisharp-linux.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.9-alpha13/omnisharp-linux-mono.tar.gz)
md5sums=('ad143121cb07c2197a7c845969841edd')
noextract=('omnisharp-linux.tar.gz')

prepare() {
  if [ -d omnisharp ]; then
    rm -rf omnisharp
  fi

  mkdir omnisharp
  tar xzvf omnisharp-linux.tar.gz -C omnisharp
}

package() {
  mkdir -p ${pkgdir}/opt/omnisharp
  cp -r omnisharp/* ${pkgdir}/opt/omnisharp
}
