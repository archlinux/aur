# Maintainer: Elmar <aur@ramle.be>
_pkgname=passmenu-otp
pkgname=$_pkgname-git
pkgver=2623a08
pkgrel=1
pkgdesc="A simple extension of passmenu friendly to one-time passwords (OTP), often used in two-factor authentication (2FA)."
arch=('any')
url="https://github.com/petrmanek/$_pkgname"
license=('MIT')
conflicts=('passmenu-otp')
provides=("passmenu-otp=${pkgver}")

depends=(
  'git'
  'pass-otp'
  'bash'
  'dmenu'
	'xdotool'
)

source=("git+${url}")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --always
}

package() {
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$_pkgname"
	install -m 755 -D "$_pkgname" "$pkgdir/usr/bin/${_pkgname}"
}
