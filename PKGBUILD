# Maintainer: goetzc
pkgname=spotifywm-git
pkgver=0.0.1
pkgrel=1
pkgdesc='Makes Spotify more friendly to window managers by settings a class name before opening the window.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'sh')
source=('spotifywm::git+https://github.com/dasJ/spotifywm/'
        'spotify.sh')
md5sums=('SKIP'
         '9d8aa6c940bd70f8f9d74be42c8eb6f0')
url=https://github.com/dasJ/spotifywm

build() {
  cd spotifywm
  make
}

package() {
  cd spotifywm

  # Library
  install -D "${srcdir}/spotifywm/spotifywm.so" "${pkgdir}"/usr/share/spotify/spotifywm.so

  # Start script
  install -Dm755 "${srcdir}/spotify.sh" "${pkgdir}/usr/bin/spotify"
}
