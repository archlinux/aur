# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=htty
pkgver=1.5.7
pkgrel=1
pkgdesc='The HTTP TTY'
arch=('any')
url='http://htty.github.io'
license=('MIT')
depends=('ruby' 'ruby-mime-types-1')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha512sums=('39397e0af06e1f9a45bad8a1c1055199bdff623afc8516bb0b17016c4f82eea98b049f1f89d4535514a694052a08b952033cc0add53eec088036df4d3c173e28')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
	rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
	install -D -m644 "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/License.markdown" "${pkgdir}/usr/share/licenses/${pkgname}/License.markdown"
}
