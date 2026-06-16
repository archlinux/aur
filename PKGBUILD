pkgname=python-home-assistant-hacs
pkgver=2.0.5
pkgrel=1
pkgdesc='Manage and discover custom elements for Home Assistant directly from the UI'
arch=('any')
url='https://hacs.xyz'
license=('MIT')
depends=('home-assistant')
replaces=('home-assistant-hacs')
conflicts=('home-assistant-hacs')
noextract=("$pkgname-$pkgver.zip")
source=("$pkgname-$pkgver.zip::https://github.com/hacs/integration/releases/download/$pkgver/hacs.zip")
sha512sums=('fcb91d2df1ee07234fbd13b1a859181c0c64022b04819503cab0980bc7fb345c0709682937cb086a76ef7cb01a3ed9fe1c28cf1edbbd4620a8875fb6fa7e7a37')
b2sums=('b81a58ce0a3b31e019b4f219c721f1e11e2f9db9cb5ce82e19686dd6f3830eca2428b82b3dfd7104993db899aea508acbed093736a05e68d4bcf54d68b0e0c99')

package() {
  local hacs_path="$pkgdir/var/lib/hass/custom_components/hacs"

  install -vd "$hacs_path"
  bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$hacs_path"
}
