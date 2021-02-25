# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgname=croco-zsh-config
pkgver=r14.66867fc
pkgrel=1
pkgdesc="Zsh configuration for Croco OS"
arch=(any)
url="https://gitlab.com/croco-os/themes-and-settings/settings/croco-zsh-config"
license=('MIT')
replaces=("manjaro-zsh-config")
provides=("manjaro-zsh-config")
conflicts=('grml-zsh-config' 'manjaro-zsh-config')
depends=('fzf'
	'croco-starship-prompt'
	'ttf-meslo-nerd-font-powerlevel10k'
	'zsh'
	'zsh-autosuggestions'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh-syntax-highlighting'
    'awesome-terminal-fonts'
    'pkgfile'
    'powerline-fonts')
makedepends=('git')
source=("git+https://gitlab.com/croco-os/themes-and-settings/settings/croco-zsh-config.git")
md5sums=('SKIP')
install=${pkgname}.install
pkgver() {
	cd "$srcdir/${pkgname}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
package() {
	cd ${srcdir}/${pkgname}
	install -D -m644 zshrc ${pkgdir}/etc/skel/.zshrc
}
