# -----------------------------------------------------------------------------
# author : damachine (christkue79@gmail.com)
# website: https://github.com/damachine
#          https://github.com/damachine/tkginstaller
# -----------------------------------------------------------------------------
# MIT License
#
# Copyright (c) 2025 damachine
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# -----------------------------------------------------------------------------
# INFO:
#   TKG-Installer
#   Easily build the TKG packages from the Frogging-Family repositories.
# DESCRIPTION:
#   This script handles building, installation and configuration for TKG/Frogminer packages.
#   It uses color output and Unicode icons for better readability.
#   Do not run as root. Use a dedicated user for security.
#   See https://github.com/damachine/tkginstaller for details.
# USAGE:
#   Interactive (Menu-mode) Run the script without arguments to enter the menu:
#       run: tkginstaller
#   Command-line (Direct-mode) Skip the menu and run specific actions directly:
#       run: tkginstaller linux          # Install Linux-TKG
#       run: tkginstaller linux config   # Edit Linux-TKG config
#   Show all available commands and shortcuts!
#       run: tkginstaller help
# -----------------------------------------------------------------------------
pkgname=tkginstaller-git
pkgver=0.25.8
pkgrel=1
provides=('tkginstaller')
replaces=('tkginstaller')
conflicts=('tkginstaller')
pkgdesc="Build, install and customize TKG source packages from the Frogging-Family repositories"
arch=('x86_64')
url="https://github.com/damachine/tkginstaller"
license=('MIT')
depends=('git' 'onefetch')
optdepends=('bat: for syntax highlighting'
            'curl: for downloading files'
            'fzf: for the interactive menu'
            'glow: for markdown rendering'
            'nano: for editing config files'
            'wdiff: for comparing config files')
install=tkginstaller.install
source=("tkginstaller::https://raw.githubusercontent.com/damachine/tkginstaller/refs/heads/master/tkginstaller")
sha256sums=('3c2b8c5b4c1b4d33886cdd651de3ba1d38e4e1d3fb658c2c44e042140440c153')

package() {
    install -Dm755 "$srcdir/tkginstaller" "$pkgdir/usr/bin/tkginstaller"
}
