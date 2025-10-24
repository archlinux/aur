# Maintainer: Dory <dory@dory.moe>
pkgname=yaoc-git
_pkgname=openai-cli
pkgver=r6.fb89fb1
pkgrel=1
pkgdesc="Yet Another OpenAI CLI chat client."
arch=('any')
url="https://github.com/doryiii/openai-cli"
license=('GPL-3.0-only')
depends=('python' 'python-html2text' 'python-rich' 'python-termcolor' 'python-requests')
makedepends=('git')
source=("git+https://github.com/doryiii/openai-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 openai_chat.py "${pkgdir}/usr/bin/openai-cli"
}

