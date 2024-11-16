pkgname=text-viewer
pkgver=1.0
pkgrel=3
pkgdesc="Simple read only text viewer."
arch=('x86_64')
depends=('gtk3' 'unzip')
source=('https://raw.githubusercontent.com/YOLOKIT/text-viewer/refs/heads/main/text-viewer.zip')
sha256sums=('SKIP')
prepare() {
  if [-d "/usr/share/applications/text-viewer/"]; then
    sudo rm -rf /usr/share/applications/text-viewer/
    sudo rm -rf /bin/text-viewer
  else
    echo "installing"
  fi
  unzip text-viewer.zip
  sudo mkdir /usr/share/applications/text-viewer
  sudo install -Dm644 "$srcdir/text-viewer.png" /usr/share/applications
  sudo install -Dm644 "$srcdir/text-viewer.desktop" /usr/share/applications
  sudo install -Dm644 "$srcdir/text-viewer" /bin
  sudo chmod +x /bin/text-viewer
}
