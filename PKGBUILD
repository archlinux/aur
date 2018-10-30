# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>

pkgname=jupyter-notebook-launcher
pkgver=1
pkgrel=1
pkgdesc="Choose the directory and the browser in which the notebook is launched in a configurable lists of choices"
arch=('any')
license=('GPL3')
url="https://github.com/gads31400/Jupyter_notebook_launcher.git"
depends=('zenity' 'terminator' 'jupyter')
source=("git+https://github.com/gads31400/Jupyter_notebook_launcher.git")

sha256sums=('SKIP')

pkgver() {
    # Identify latest version.
    cd "$srcdir"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
	    rm -rf "${srcdir}/Jupyter_notebook_launcher/Makefile"
        install -Dm644 "${srcdir}/Jupyter_notebook_launcher/jupyter.sh" "${pkgdir}/usr/bin/jupyter.sh"
        install -Dm644 "${srcdir}/Jupyter_notebook_launcher/jupyter.desktop" "${pkgdir}/usr/share/applications/jupyter.desktop"
        install -Dm644 "${srcdir}/Jupyter_notebook_launcher/jupyter.png" "${pkgdir}/usr/share/pixmaps/jupyter.png"
	    install -Dm644 "${srcdir}/Jupyter_notebook_launcher/dir_jupyter.txt" "${pkgdir}/usr/share/jupyter/dir_jupyter.txt"

} 

