# Maintainer: Luis Pérez <luis.perez@protonmail.com>

pkgname=ruby-mime
_gemname=mime
pkgver=0.4.4
pkgrel=1
pkgdesc="library for building RFC compliant Multipurpose Internet Mail Extensions (MIME) messages."
arch=('any')
license=('ISC')
makedepends=('ruby' 'ruby-rdoc')
options=('!distcc' '!emptydirs')
url="https://rubygems.org/gems/mime"
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
	"https://github.com/dbinary/ruby-mime/raw/main/LICENSE"
	)
sha512sums=('2fb3901979c6efeef9fed69d2c8523f77fda68503b86ccf3f932c8fffc1172cab964d9057c80b8fd0c354b7033bd2af1a9e599e7724a0b2e224a76cf68dd55fa'
	'SKIP'
	)
noextract=("${_gemname}-${pkgver}.gem"
	   "LICENSE"
	  )

package() {
  cd ${srcdir}
  local _gemdir="$(ruby -r rubygems -e'puts Gem.default_dir')"
  if [[ $CARCH == arm* ]] ; then
    gem install --no-user-install --ignore-dependencies --no-document -i "${pkgdir}$_gemdir" ${_gemname}-${pkgver}.gem
  else
    gem install --no-user-install --ignore-dependencies -i "${pkgdir}$_gemdir" ${_gemname}-${pkgver}.gem
  fi
}
