pkgname=fzf-tab-source
pkgver=1.0.1
pkgrel=1
pkgdesc="Replace zsh's default completion selection menu with fzf.Add file and directory previews,and can use rg or rga to assist fzf searches.
         After the installation is completed,Add 'source /usr/share/zsh/plugins/fzf-tab-source/fzf-tab.plugin.zsh' to ~/.zshrc"
arch=('x86_64')
url="https://github.com/aslingguang/fzf-tab-source"
license=('GPL')
depends=('zsh' 'fzf')
makedepends=('git')
conflicts=('fzf-tab-git' 'fzf-tab-bin-git' )
optdepends=('exa: replace ls'
	'chafa: preview picture'
	'perl-image-exiftool: preview metadata'
	'python-pdftotext: preview pdf'
	'bat: preview text'
	'python-xlsx2csv: preview xlsx'
	'perl-xls2csv: preview xlsx'
	'csvkit: process csv'
	'pandoc: preview docx'
	'atool: preview deb,gz,jar,rpm,tar,tgz,xz,zip,etc '
	'unzip: preview zip'
	'unrar: preview rar'
	'p7zip: preview 7z'
	'fd: quickly search for files and directories, faster than the default find')
source=("git+https://github.com/aslingguang/fzf-tab-source.git")
sha256sums=('SKIP')


package() {
	cd "$srcdir/$pkgname"
	install -dm755 "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
	cp -dr --no-preserve=ownership {fzf-tab.zsh,lib,modules} \
	"${pkgdir}/usr/share/zsh/plugins/${pkgname}"
	ln -s "fzf-tab.zsh" \
	"${pkgdir}/usr/share/zsh/plugins/${pkgname}/fzf-tab.plugin.zsh"
}
