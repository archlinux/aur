#! /bin/bash

# Sourced from:
PackageUrl="https://raw.githubusercontent.com/Askannz/optimus-manager/master/package"


DownloadFiles () {
	if [[ ! -f "${PWD}/PKGBUILD-src" ]]; then
		curl --silent "${PackageUrl}/optimus-manager.install" > "${PWD}/optimus-manager.install"
		curl --silent "${PackageUrl}/PKGBUILD" > "${PWD}/PKGBUILD-src"
	fi
}


UpdateSrcInfo () {
	if [[ -z "${SRCINFO}" ]]; then
		export SRCINFO=x
		makepkg --printsrcinfo > ".SRCINFO"
	fi
}


DownloadFiles
source "${PWD}/PKGBUILD-src"
pkgver=r732.fced1de.python3.12
UpdateSrcInfo
